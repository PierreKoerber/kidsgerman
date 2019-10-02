<?php

namespace AppBundle\Controller;

use AppBundle\Entity\lesson;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Lesson controller.
 *
 * @Route("lesson")
 */
class lessonController extends Controller
{

    /**
     * @Route("/vlearn/{id}", name="vlesson_learn")
     * @Method("GET")
     */
    public function vlearnAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        //dump($id) ;
        $lesson= $em->getRepository('AppBundle:lesson')->findOneById($id);

        $words = $lesson->getWords()->toArray() ;
      
        
        return $this->render('lesson/vlearn.html.twig', array(
            'lesson' => $lesson,
            'words' => $words
        ));
    }

    /**
     * @Route("/getwordsjson/{id}", name="lesson_words_json")
     * @Method("GET")
     */
    public  function getWordsLessonAction($id){
        $em = $this->getDoctrine()->getManager();
        $lesson= $em->getRepository('AppBundle:lesson')->findOneById($id);

        $json = $this->get('jms_serializer')->serialize($lesson->getWords(), 'json') ;
        //$json = json_encode($lessons) ;
        
        $response = new Response( $json ) ;
        $response->headers->set('Content-Type', 'application/json') ;
        return $response ;

    }


    /**
     * @Route("/json/{id}", name="lesson_json")
     * @Method("GET")
     */
    public  function getLessonAction(){
        $em = $this->getDoctrine()->getManager();
        $lessons = $em->getRepository('AppBundle:lesson')->findAll();

        $json = $this->get('jms_serializer')->serialize($lessons, 'json') ;
        //$json = json_encode($lessons) ;
        
        $response = new Response( $json ) ;
        $response->headers->set('Content-Type', 'application/json') ;
        return $response ;

    }



    /**
     * @Route("/learn/{id}", name="lesson_learn")
     * @Method("GET")
     */
    public function learnAction(lesson $lesson)
    {
        $deleteForm = $this->createDeleteForm($lesson);
        //dump( $lesson ) ;
        $words = array_rand( $lesson->getWords()->toArray() ) ;
        //dump($words) ;

        $words =  array() ;
        foreach($lesson->getWords() as $w ){
            $words[] = $w ;
        }

   
        shuffle($words) ;


        return $this->render('lesson/learn.html.twig', array(
            'lesson' => $lesson,
            'delete_form' => $deleteForm->createView(),
            'words' => $words
        ));
    }


    /**
     * Lists all lesson entities.
     *
     * @Route("/", name="lesson_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $lessons = $em->getRepository('AppBundle:lesson')->findAll();

        return $this->render('lesson/index.html.twig', array(
            'lessons' => $lessons,
        ));
    }

    /**
     * Creates a new lesson entity.
     *
     * @Route("/new", name="lesson_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $lesson = new Lesson();
        $form = $this->createForm('AppBundle\Form\lessonType', $lesson);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($lesson);
            $em->flush();

            return $this->redirectToRoute('lesson_show', array('id' => $lesson->getId()));
        }

        return $this->render('lesson/new.html.twig', array(
            'lesson' => $lesson,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a lesson entity.
     *
     * @Route("/{id}", name="lesson_show")
     * @Method("GET")
     */
    public function showAction(lesson $lesson)
    {
        $deleteForm = $this->createDeleteForm($lesson);
      
        return $this->render('lesson/show.html.twig', array(
            'lesson' => $lesson,
            'delete_form' => $deleteForm->createView(),
          
        ));
    }

    /**
     * Displays a form to edit an existing lesson entity.
     *
     * @Route("/{id}/edit", name="lesson_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, lesson $lesson)
    {
        $deleteForm = $this->createDeleteForm($lesson);
        $editForm = $this->createForm('AppBundle\Form\lessonType', $lesson);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('lesson_edit', array('id' => $lesson->getId()));
        }

        return $this->render('lesson/edit.html.twig', array(
            'lesson' => $lesson,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a lesson entity.
     *
     * @Route("/{id}", name="lesson_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, lesson $lesson)
    {
        $form = $this->createDeleteForm($lesson);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($lesson);
            $em->flush();
        }

        return $this->redirectToRoute('lesson_index');
    }

    /**
     * Creates a form to delete a lesson entity.
     *
     * @param lesson $lesson The lesson entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(lesson $lesson)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('lesson_delete', array('id' => $lesson->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
